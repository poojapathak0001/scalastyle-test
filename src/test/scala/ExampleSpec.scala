import collection.mutable.Stack
import org.scalatest._
import org.demo.scala.Demo;

class ExampleSpec extends FlatSpec with Matchers {
   
  "printString" should "print Hello World" in {
    val obj = new Demo
    
    obj.printString("Hello") should be ("Hello World");
  }
  
  it should "not print anything" in {
    val obj = new Demo
    obj.printString("") should not be ("Hello World");
  }

//  "A Stack" should "pop values in last-in-first-out order" in {
//    val stack = new Stack[Int]
//    stack.push(1)
//    stack.push(2)
//    stack.pop() should be (2)
//    stack.pop() should be (1)
//  }
//
//  it should "throw NoSuchElementException if an empty stack is popped" in {
//    val emptyStack = new Stack[Int]
//    a [NoSuchElementException] should be thrownBy {
//      emptyStack.pop()
//    } 
//  }
}