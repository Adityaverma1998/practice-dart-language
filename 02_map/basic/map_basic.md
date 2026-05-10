# 🗂️ Map — Basics

> A Map holds **key → value** pairs. Every key is unique. Values can be anything.  
> Think of it like a dictionary — you look up a word (key) to get its meaning (value).

---

## 📌 What is `Map<String, dynamic>`?

```dart
Map<String, dynamic> user = {
  'name'   : 'Aditya',              // String value
  'roleNo' : 24,                    // int value
  'sub'    : ['English', 'Hindi'],  // List value
};
```

| Part | Meaning |
|------|---------|
| `Map` | Dart's built-in key-value collection |
| `String` | Type of key — always a String here |
| `dynamic` | Value can be **any** type (String, int, List, etc.) |

---

## 🛠️ Create a Map — 3 Ways

### 1. Literal (most common)

```dart
Map<String, int> marks = {'Maths': 90, 'English': 85};
```

### 2. Empty then fill

```dart
Map<String, int> marks = {};
marks['Maths']   = 90;
marks['English'] = 85;
```

### 3. Map() constructor

```dart
var marks = Map<String, int>();
marks['Maths'] = 90;
```

---

## 🔍 Access Values — by key with `[ ]`

```dart
print(user['name']);    // Aditya
print(user['roleNo']); // 24
print(user['xyz']);    // null ← key doesn't exist, returns null (no crash)
```

> ⚠️ Accessing a missing key returns `null` — it does NOT throw an error.

---

## 🔄 Loop Through a Map

### 1. `forEach` — key and value together

```dart
user.forEach((key, value) {
  print('$key → $value');
});

// Output:
// name   → Aditya
// roleNo → 24
// sub    → [English, Hindi]
```

### 2. `for-in` with `.entries`

```dart
for (var e in user.entries) {
  print('${e.key} → ${e.value}');
}
```

> Use `.entries` when you need more control — `break`, `continue`, or index tracking.

### 3. Loop only keys or only values

```dart
for (var k in user.keys)   print(k); // name, roleNo, sub
for (var v in user.values) print(v); // Aditya, 24, [English, Hindi]
```

---

## ➕ Add / Update / Delete

```dart
Map<String, int> marks = {'Maths': 90, 'English': 85};

marks['Science'] = 78;  // add new key
marks['Maths']   = 95;  // update existing key
marks.remove('English'); // delete a key
marks.clear();           // delete all keys

print(marks.length);     // number of keys
```

---

## ✅ Check Existence

```dart
Map<String, int> marks = {'Maths': 90};

marks.containsKey('Maths');   // true
marks.containsValue(90);      // true
marks.containsKey('Hindi');   // false

marks.isEmpty;    // false
marks.isNotEmpty; // true
```

---

## 🔐 Safe Access with `??` (null-coalescing)

```dart
Map<String, int> scores = {'Alice': 90};

print(scores['Bob']);       // null ← risky if you do math on it
print(scores['Bob'] ?? 0); // 0    ← safe default

// Most common interview pattern — frequency count:
scores['Bob'] = (scores['Bob'] ?? 0) + 1;
```

---

## 🔁 `putIfAbsent` — Add Only If Key Missing

```dart
Map<String, int> scores = {'Alice': 90};

scores.putIfAbsent('Alice', () => 0);
// Alice already exists → NOT changed, stays 90

scores.putIfAbsent('Bob', () => 0);
// Bob doesn't exist → added with value 0

print(scores); // {Alice: 90, Bob: 0}
```

> Used heavily in **grouping** problems. See `03_problems/`.

---

## 🔀 Merge Maps — Spread Operator

```dart
Map<String, int> a = {'x': 1};
Map<String, int> b = {'y': 2};

var merged = {...a, ...b};
print(merged); // {x: 1, y: 2}

// If same key exists in both, LAST one wins:
var c = {...a, 'x': 99};
print(c); // {x: 99}
```

---

## 🔄 `map()` — Transform Values

```dart
Map<String, int> marks = {'Maths': 40, 'English': 60};

var doubled = marks.map((k, v) => MapEntry(k, v * 2));
print(doubled); // {Maths: 80, English: 120}
```

> `map()` on a Map returns a new Map. Original is NOT changed.

---

## 🔁 Convert List ↔ Map

### List → Map (with index)

```dart
List<String> subjects = ['English', 'Hindi', 'Maths'];

Map<String, int> subMap = {
  for (int i = 0; i < subjects.length; i++) subjects[i]: i
};

print(subMap); // {English: 0, Hindi: 1, Maths: 2}
```

### Map → List

```dart
List keys = subMap.keys.toList();   // [English, Hindi, Maths]
List vals = subMap.values.toList(); // [0, 1, 2]
```

---

## ⚡ Quick Reference

| Operation | Code |
|-----------|------|
| Create | `Map<String, int> m = {'a': 1};` |
| Add / Update | `m['b'] = 2;` |
| Delete | `m.remove('a');` |
| Access | `m['a']` → value or `null` |
| Safe access | `m['a'] ?? 0` |
| Check key | `m.containsKey('a')` |
| Check value | `m.containsValue(1)` |
| Length | `m.length` |
| Loop | `m.forEach((k,v) { })` |
| All keys | `m.keys` |
| All values | `m.values` |
| All pairs | `m.entries` |
| Transform | `m.map((k,v) => MapEntry(k, v))` |
| Merge | `{...m1, ...m2}` |
| Clear | `m.clear()` |

---

## 🚫 Common Mistakes

```dart
// ❌ WRONG — null crash if key missing
int total = marks['Hindi'] + 10;

// ✅ RIGHT
int total = (marks['Hindi'] ?? 0) + 10;
```

```dart
// ❌ WRONG — modifying map while iterating throws error
user.forEach((k, v) { user.remove(k); });

// ✅ RIGHT — collect keys first, then remove
List keysToRemove = user.keys.toList();
keysToRemove.forEach((k) => user.remove(k));
```

---

## 📁 Next

- [`02_operations/`](../02_operations/) — merge, filter, group, invert
- [`03_problems/`](../03_problems/) — interview-style questions