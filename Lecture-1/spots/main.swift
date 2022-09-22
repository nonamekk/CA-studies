// Lecture 1

var total_count: UInt8 = 32
var b_spots: UInt8 = 0;
var w_spots: UInt8 = 0;

for i in 0...total_count {
    if ((UInt8.random(in: 0..<total_count)) > i) {
        w_spots+=1
    } else {b_spots+=1}
}

print("Black spots", b_spots)
print("White spots", w_spots)
