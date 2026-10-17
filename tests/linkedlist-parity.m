/*
 * Copyright (C) 2026, LibreDarwin
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * Behavior fixture for IKLinkedList, IKLinkedListLink, IKLinkedListNode and
 * IKLinkedListNodePool. Loads the framework under test with dlopen() and
 * drives it through a fixed script, emitting one "label<TAB>value" record per
 * observation. Run against Apple's ImageKit and against ours, then diff.
 */

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <dlfcn.h>
#import <stdio.h>

@protocol IKLinkedListLinkProtocol <NSObject>
- (id)next;
- (void)setNext:(id)arg1;
- (id)previous;
- (void)setPrevious:(id)arg1;
@end

@interface IKLinkedListLink : NSObject
- (id)next;
- (void)setNext:(id)arg1;
- (id)previous;
- (void)setPrevious:(id)arg1;
@end

@interface IKLinkedListNode : IKLinkedListLink
- (id)value;
- (void)setValue:(id)arg1;
@end

@interface IKLinkedList : NSObject
- (NSUInteger)count;
- (id)first;
- (id)last;
- (id)objectAtIndex:(NSUInteger)arg1;
- (void)addFirst:(id)arg1;
- (void)addLast:(id)arg1;
- (void)remove:(id)arg1;
- (void)moveFirst:(id)arg1;
- (void)moveLast:(id)arg1;
- (void)checkListConsistency;
@end

@interface IKLinkedListNodePool : NSObject
- (id)init;
- (id)node;
- (void)releaseNode:(id)arg1;
- (void)free;
@end

static void emit(NSString *label, NSString *value) {
    printf("%s\t%s\n", label.UTF8String, value.UTF8String);
}

static NSString *same(id a, id b) {
    return a == b ? @"1" : @"0";
}

static NSString *nn(id o) {
    return o == nil ? @"nil" : @"obj";
}

static NSString *cls(id o) {
    return o == nil ? @"nil" : [NSString stringWithUTF8String:class_getName(object_getClass(o))];
}

static NSString *val(id node) {
    if (node == nil) return @"nil";
    id v = [node value];
    return v == nil ? @"nil" : [NSString stringWithFormat:@"%@", v];
}

static NSString *order(IKLinkedList *list) {
    NSMutableArray *parts = [NSMutableArray array];
    NSUInteger n = [list count];
    for (NSUInteger i = 0; i < n; i++) {
        id node = [list objectAtIndex:i];
        [parts addObject:val(node)];
    }
    NSMutableArray *walk = [NSMutableArray array];
    for (id n2 = [list first]; n2 != nil; n2 = [n2 next]) {
        [walk addObject:val(n2)];
    }
    return [NSString stringWithFormat:@"[%@]|[%@]",
            [parts componentsJoinedByString:@","],
            [walk componentsJoinedByString:@","]];
}

static void state(IKLinkedList *list, NSString *tag) {
    emit([tag stringByAppendingString:@"|count"],
         [NSString stringWithFormat:@"%lu", (unsigned long)[list count]]);
    emit([tag stringByAppendingString:@"|first"], val([list first]));
    emit([tag stringByAppendingString:@"|last"], val([list last]));
    emit([tag stringByAppendingString:@"|order"], order(list));
}

static void listScenario(void) {
    Class linkCls = objc_getClass("IKLinkedListLink");
    Class nodeCls = objc_getClass("IKLinkedListNode");
    Class listCls = objc_getClass("IKLinkedList");

    emit(@"protocol|linkConforms",
         [linkCls conformsToProtocol:@protocol(IKLinkedListLinkProtocol)] ? @"1" : @"0");
    emit(@"protocol|nodeConforms",
         [nodeCls conformsToProtocol:@protocol(IKLinkedListLinkProtocol)] ? @"1" : @"0");

    IKLinkedList *list = [[listCls alloc] init];
    state(list, @"empty");
    emit(@"empty|firstNil", nn([list first]));
    emit(@"empty|lastNil", nn([list last]));
    emit(@"empty|at0", val([list objectAtIndex:0]));
    emit(@"empty|at5", val([list objectAtIndex:5]));

    id a = [[nodeCls alloc] init];
    id b = [[nodeCls alloc] init];
    id c = [[nodeCls alloc] init];
    id d = [[nodeCls alloc] init];
    [a setValue:@"a"];
    [b setValue:@"b"];
    [c setValue:@"c"];
    [d setValue:@"d"];

    emit(@"node|valA", val(a));
    emit(@"node|valB", val(b));
    emit(@"node|classA", cls(a));

    [list addLast:a];
    [list addLast:b];
    [list addFirst:c];
    state(list, @"afterAdds");
    emit(@"afterAdds|firstIsC", same([list first], c));
    emit(@"afterAdds|lastIsB", same([list last], b));
    emit(@"afterAdds|at1IsA", same([list objectAtIndex:1], a));
    emit(@"afterAdds|at100", val([list objectAtIndex:100]));

    [list moveFirst:a];
    state(list, @"moveFirstA");
    [list moveFirst:a];
    state(list, @"moveFirstA2");

    [list moveLast:c];
    state(list, @"moveLastC");
    [list moveLast:c];
    state(list, @"moveLastC2");

    [list remove:b];
    state(list, @"removeB");
    [list remove:b];
    state(list, @"removeB2");

    [list moveFirst:d];
    state(list, @"moveFirstDabsent");

    [list addFirst:nil];
    [list addLast:nil];
    state(list, @"addNil");

    [list checkListConsistency];
    emit(@"consistent|ok", @"1");

    [list remove:a];
    [list remove:c];
    state(list, @"drained");
    emit(@"drained|firstNil", nn([list first]));
    emit(@"drained|lastNil", nn([list last]));
    [list checkListConsistency];
    emit(@"drained|ok", @"1");
}

static void linkScenario(void) {
    Class linkCls = objc_getClass("IKLinkedListLink");
    id x = [[linkCls alloc] init];
    id y = [[linkCls alloc] init];

    emit(@"link|nextNil", nn([x next]));
    emit(@"link|prevNil", nn([x previous]));

    [x setNext:y];
    emit(@"link|nextIsY", same([x next], y));
    [x setNext:y];
    emit(@"link|nextIsYagain", same([x next], y));
    [x setNext:nil];
    emit(@"link|nextCleared", nn([x next]));

    [x setPrevious:y];
    emit(@"link|prevIsY", same([x previous], y));
    [x setPrevious:nil];
    emit(@"link|prevCleared", nn([x previous]));
}

static void poolScenario(void) {
    Class poolCls = objc_getClass("IKLinkedListNodePool");
    Class nodeCls = objc_getClass("IKLinkedListNode");
    IKLinkedListNodePool *pool = [[poolCls alloc] init];

    id n1 = [pool node];
    emit(@"pool|n1cls", cls(n1));
    emit(@"pool|n1isNode", same(object_getClass(n1), nodeCls) ? @"1" : @"0");
    emit(@"pool|n1valNil", val(n1));

    id n2 = [pool node];
    emit(@"pool|n2diffN1", same(n2, n1));
    emit(@"pool|n2cls", cls(n2));

    [pool releaseNode:n1];
    id n3 = [pool node];
    emit(@"pool|reused", same(n3, n1));

    id n4 = [pool node];
    emit(@"pool|n4cls", cls(n4));

    [pool releaseNode:nil];

    [pool free];
    id n5 = [pool node];
    emit(@"pool|afterFreeNew", same(n5, n1));
    emit(@"pool|afterFreeCls", cls(n5));

    [pool releaseNode:n5];
    id n6 = [pool node];
    emit(@"pool|afterFreeReuseN5", same(n6, n5));
}

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "usage: %s <path to ImageKit>\n", argv[0]);
        return 2;
    }
    if (dlopen(argv[1], RTLD_NOW) == NULL) {
        fprintf(stderr, "dlopen(%s) failed: %s\n", argv[1], dlerror());
        return 2;
    }
    if (objc_getClass("IKLinkedList") == nil) {
        fprintf(stderr, "IKLinkedList not found\n");
        return 1;
    }

    listScenario();
    linkScenario();
    poolScenario();

    return 0;
}
