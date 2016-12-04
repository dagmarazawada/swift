import Cocoa

print("hello swift - zmienne")


// 2.1. Tworzenie zmiennych i stałych

var numOfStudents = 10      // zmienna
let pi = 3.14159            // stała

numOfStudents = 5
numOfStudents = 7
print(numOfStudents)

var age = 40                // niejawnie określony typ
var numOfItems:Int = 10     // jawne określony typ
var name:String = "dag"



// 2.2. Typy zmiennych VariableTypes

let anInt:Int = 32
let aFloat:float_t = 10.05
let aDouble:double_t = 5.0000008
let aBoolean:Bool = true
let aString:String = "tiruriru"
let anImplicitInteger = 7
var anImplicitFloat = 10.5



// 2.3. Operatory arytmetyczne ArithmeticOperators

let a = 10
var b = 5

var c = a + b
print(c)

var d = 100-99.9

var e:Int = 72 * 9
print(e)

var f = 9087 / 16.55
print(f)

var g = 10 % 7
print(g)

b += 1              // b++ & ++b deprecated
print(b)



// 2.4. Rzutowanie typu

var value = 145
//value = 149.99234 // error

var secondValue = 99.9
secondValue = 10

var preciseValue = Double(value)

preciseValue = preciseValue + 0.99234




// 2.5. Interpolacja ciągu tekstowego

var cookies = 5
var cookiesString = String(cookies)
print("Mamy " + cookiesString + " ciastek")
print("Mamy " + String(cookies+1) + " ciastek")

print("Mamy \(cookies) ciastek")

print("Mój pies ma \(7*3) psich lat")



// 3.1. If

var apples = 5

if apples > 0 {
    print("jest \(apples) jabłek")
}
else {
    print("brak jabłek")
}



// 3.2. Złożone if

var citizen = true
var age2 = 19

if citizen == true && age2 >= 18 {
    print("można głosować")
}
else {
    print("nie można głosować")
}

var gpa = 3
var testScore = 1500

if gpa > 2 || testScore > 1200 {
    print("ilość punktów ok")
}

if testScore > 1500 {
    print("A")
}
else if testScore > 1000 {
    print("B")
}
else if testScore > 600 {
    print("C")
}



// 3.3. Switch

var grade = "X"

switch grade {
    case "A", "a" : print("aaa")
    case "B": print("bbb")
default: print("none")
}



// 3.4. Pętla while

var x = 0

while x < 5 {
    print(x)
    x += 1
}

var testScores:[Int] = [1, 2, 3, 10, 20, 30]
var i = 0

while i < testScores.count {
    print(testScores[i])
    i += 1
}



// 3.5. Pętla for

for i in 0 ..< 21 {
    print(i)
}



// 3.6. Pętla for-in

var shoppinglist:[String] = ["a", "b", "c"]

print("Zakupy: ")
for item in shoppinglist {
    print(item)
}

for num in 1...6 {
    print(num)
}



// 4.1. Tablice

var animals:[String] = ["pies", "kot", "koń"]

var gpas = [3.25, 2.55, 1.1, 3.99, 4.0, 2.911]

print(animals[2])

animals[2] = "ptak"

for animal in animals{
    print(animal)
}



//4.2. array.count(), array.slice()

gpas.count

print("tablica zawiera \(gpas.count) elementów")

for gpa in gpas {
    print(gpa)
}

print(gpas[0...3])

print(gpas[3..<gpas.count])



//4.3. funkcje tablicy

var teams:[String] = ["Yankees", "Jets", "Mets", "Nets"]

var ingredients:[String] = []

if ingredients.isEmpty {
    print("empty")
}
else {
    print("tablica wpełniona")
}

teams.append("Devils")

var newIngredients:[String] = ["jajka", "cukier", "masło"]

ingredients.append("mleko")

ingredients += newIngredients

print(ingredients)

ingredients.insert("soda", atIndex:1)

ingredients.removeAll()

ingredients.isEmpty

// ingredients.removeLast()

if ingredients.isEmpty == false{
    ingredients.removeLast()
}

// ingredients.removeAtIndex(0)

print(ingredients)



// 4.4. Utworzenie słownika

var dict:[String:Double] = ["Kowalski" : 3.1, "Nowak":2.5]

print(dict)

print(dict["Kowalski"])

for (name, dic) in dict {
    print(name, dic)
}



// 4.5. Funkcje słownika

var students = [1:"A", 2:"B", 3:"C"]

for (idNum, name) in students {
    print("\(idNum) to: \(name)")
}

students[4] = "D"

var replacedValue = students.updateValue("E", forKey: 2)

print("Zastąpiona wartość to \(replacedValue) czyli \(students[2])")

var deletedValue = students.removeValueForKey(2)

print("usunięta wartosc to \(deletedValue)")

for (idNum, name) in students {
    print("\(idNum) to: \(name)")
}



// 5.1 Funkcje

func sayHello() {
    print("hello")
}

sayHello()

func byeBye() {
    print("bye")
}

byeBye()



// 5.2. Funkcje pobierające argumenty

func sayGreetings(name: String){
    print("hello \(name)")
}

sayGreetings("dag")

func solveHypot(sideA: float_t, sideB: float_t) {
    var sideC = (sideA * sideA) + (sideB * sideB)
    sideC = sqrt(sideC)
    print(sideC)
}

solveHypot(3, sideB: 4)



// 5.3. Funkcje zwracające wartość

func randomInt(min: Int, max: Int) -> Int
{
    return min + Int(arc4random_uniform(UInt32(max-min+1)))
}

randomInt(0, max:10)


func randomGreeting()->String {
    var greetings = ["hello", "hej", "heja", "witaj"]
    var greetingNumber = randomInt(0, max:greetings.count-1)
    return greetings[greetingNumber]
}

randomGreeting()
randomGreeting()
randomGreeting()
randomGreeting()
randomGreeting()
randomGreeting()
randomGreeting()



// 5.4. Funkcje i zasięg zmiennej lub stałej 





















