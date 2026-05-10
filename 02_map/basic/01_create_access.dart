/// Map = key → value store
/// A Map holds pairs. Every key is unique. Values can be anything. 
/// Think of it like a dictionary — you look up a word (key) to get a meaning (value).


// Your exact code — let's break it down
Map<String, dynamic> user = {
  'name'   : 'Aditya',      // String value
  'roleNo' : 24,            // int value
  'sub'    : ['English', 'Hindi']  // List value
};
// dynamic = any type is allowed as value

/// Create a Map — 3 ways

///Literal (most common)
Map<String, int> marks = {'Maths': 90, 'English': 85};

/// Empty then fill
Map<String, int> marks = {};
marks['Maths']   = 90;
marks['English'] = 85;

///Map() constructor
var marks = Map<String, int>();
marks['Maths'] = 90;

///Access values

By key with [ ]

print(user['name']);     // Aditya
print(user['roleNo']);  // 24
print(user['xyz']);     // null  ← key doesn't exist


///Loop through a Map

///1) forEach — same as your code



user.forEach((key, value) {
  print('$key → $value');
});
// name    → Aditya
// roleNo  → 24
// sub     → [English, Hindi, Maths, Computer]


///for-in with .entries

for (var e in user.entries) {
  print('${e.key} → ${e.value}');
}


////Loop only keys or values

for (var k in user.keys)   print(k);
for (var v in user.values) print(v);
