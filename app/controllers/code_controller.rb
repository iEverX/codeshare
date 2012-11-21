class CodeController < ApplicationController
  def share
  end

  def show
    @code = "class Hello\n  def say_hello\n    puts 'Hello'\n  end\nend"
    @code2 = "for x in range(10):\n    print(\"Hello, World\")"
    @code3 = "`print(\"HelLo\")`\n# this is the first day of that\n\n## Hello, world\n\n* hllo  \n* kisf  \n* tsdf  \n\n        for x in ragne(10):\n            print(\"Hello, World\")"
  end

  def edit
  end

  def delete
  end

end
