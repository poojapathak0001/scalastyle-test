name := "$name$"

organization := "$organization$"

version := "$version$"

scalaVersion := "2.12.3"

libraryDependencies ++= Seq(
  "org.scalatest" %% "scalatest" % "3.2.0" % "test" withSources() withJavadoc(),
)

initialCommands := "import $organization$.$name;format="lower,word"$._"

