object Main {
  def main(args: Array[String]) {
    val n = if (args.isEmpty) 1000 else args(0).toInt
    val result = (1 until n).filter(x => x % 3 == 0 || x % 5 == 0).sum
    println(result)
  }
}
