import  org.junit.Assert._;

import org.junit.Test;

import org.demo.scala.Demo;

class ScalaTest {

  val obj = new Demo
  @Test def printHelloTest {
    assertEquals("Hello World", obj.printString("Hello"))
  }
  
  @Test def printHelloTest2 {
    assertNotEquals("p", obj.printString("Hello World"))
  }
}