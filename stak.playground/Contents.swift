import Foundation


public struct Stack<Element>{
    //inkopsling
    
    //properties den er sat til defealt værdie
    private var storage: [Element] = []
    
    //computet properties fra læren
    public var isEmpty: Bool{
        peek() == nil
    }
    public mutating func push(_ element: Element){
        storage.append(element)//append den tilføjer en ny element
    }
    //pop remove the top-most element
    public mutating func pop()-> Element?{
        return storage.popLast()
    }
    public func peek()-> Element?{
        return storage.last // når den er en linje code kan man undgår at skrive return
    }
}

extension Stack: CustomStringConvertible{
    public var description: String {
     """
     ----TOP----
     \(storage.map{"\($0)"}.reversed().joined(separator:"\n"))
     -----------
     """
    }
}
// den laver en kopie af storage
// et kalde \()

func printInReverse<L> (_ array: [L]){
    var stack = Stack<L>()
    for value in array {
        stack.push(value)
    }
    while let value = stack.pop(){
        print(value)
    }
}

printInReverse(["a","b","c","d","e"])

func check(_ string: String) -> Bool{
    var stack = Stack<Character>()
    for character in string{
        if character == "("{
            stack.push(character)
        }else if character == ")"{
            if stack.isEmpty {
                return false
            }else{
                stack.pop()
            }
        }
    }
    return stack.isEmpty
}
print(check("h((e))llo(world)()"))
print(check("(hello world"))

//initialize the stack når man lave en struct den laver selv initializer
//initializar er kaldet via ()
var element = Stack<Int>()
element.push(1)
element.push(3)
element.push(17)
print(element)


