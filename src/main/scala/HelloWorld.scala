package org.demo.scala

object HelloWorld {
  
  def main(args: Array[String]) {
    val d = new Demo
    println(d.printString("Hello"))
  }
}

class Demo {
    def printString(s : String): String =  {
    if(!s.equals(""))
      return s + " World"
    else
      return ""
  }
}
