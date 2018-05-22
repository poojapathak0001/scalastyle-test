package org.demo.scala
import scala.collection.immutable.StringOps;

object HelloWorld {
  
  def main(args: Array[String]) {
    var d = new Demo
    println(d.printString("Hello"))
  }
}

class Demo {
    def printString(s : String): String =  {
    if(!s.equals("Hello"))
      return s + " World"
    else
      return "World"
  }
}
