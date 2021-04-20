class SlotNum

  def initialize()
  end

  def slotNum1
    @left1 =  rand(0..9)
    @left2 =  rand(0..9)
    @left3 =  rand(0..9)
    puts "--------------"
    puts"|#{@left1}|||"
    puts"|#{@left2}|||"
    puts"|#{@left3}|||"
  end

  def slotNum2
    @center1 =  rand(0..9)
    @center2 =  rand(0..9)
    @center3 =  rand(0..9)
    puts "--------------"
    puts"|#{@left1}|#{@center1}||"
    puts"|#{@left2}|#{@center2}||"
    puts"|#{@left3}|#{@center3}||"
  end

  def slotNum3
    @rigth1 =  rand(0..9)
    @rigth2 =  rand(0..9)
    @rigth3 =  rand(0..9)
    #コメントを外したら、数字が全て１に揃う
    # @left1 = 1
    # @center1 = 1
    # @rigth1 = 1
    # #
    # # @left2 = 1
    # # @center2 = 1
    # # @rigth2 = 1
    # #
    # # @left3 = 1
    # # @center3 = 1
    # # @rigth3 = 1
    puts "--------------"
    puts"|#{@left1}|#{@center1}|#{@rigth1}|"
    puts"|#{@left2}|#{@center2}|#{@rigth2}|"
    puts"|#{@left3}|#{@center3}|#{@rigth3}|"

  end
  def slotTmp
    puts "--------------"
    puts "残りコイン数 #{@coin}"
    puts "何コイン入れますか？"
    puts "ポイント#{@point}"
    puts "1(10コイン)2(30コイン)3(50コイン)4(やめとく)"
    puts "--------------"
  end

  def slotCalculation
    case
    when @incoin == 1
      @getcoin = 20
      @getpoint = 100
      @coin += @getcoin
      @point += @getpoint
    when @incoin == 2
      @getcoin = 60
      @getpoint = 300
      @coin += @getcoin
      @point += @getpoint
    when @incoin == 3
      @getcoin = 100
      @getpoint = 500
      @coin += @getcoin
      @point += @getpoint
    end
  end


  def slotResult
    if(@left1 === @center1 && @center1 === @rigth1 && @left1 === @center1)
      slotCalculation
      puts "上で#{@left1}が揃いました！"
      puts "#{@getpoint}ポイント獲得！"
      puts "#{@getcoin}コイン獲得！"
      puts "--------------"
    elsif(@left2 === @center2 && @center2 === @rigth2 && @left2 === @center2)
      slotCalculation
      puts "真ん中で#{@left2}揃いました"
      puts "#{@getpoint}ポイント獲得！"
      puts "#{@getcoin}コイン獲得！"
      puts "--------------"
    elsif(@left3 === @center3 && @center3 === @rigth3 && @left3 === @center3)
      slotCalculation
      puts "下で#{@left3}揃いました"
      puts "#{@getpoint}ポイント獲得！"
      puts "#{@getcoin}コイン獲得！"
      puts "--------------"
    end

  end

  def play(coin,point)
    @coin = coin.to_i
    @point = point.to_i
    slotTmp
    @incoin = gets.to_i


    if (@coin < 50)
        while  @incoin == 3
          puts "金額がたりません1or2を入力してください"
          @incoin = gets.to_i
        end
    end

    if (@coin < 30)
        while @incoin == 2 || @incoin == 3
          puts "金額がたりません1を入力してください"
          @incoin = gets.to_i
        end
    end

    while @incoin != 1 && @incoin != 2 && @incoin != 3 && @incoin != 4 do
      puts "半角英数1,2,3,4を入力してください"
      @incoin = gets.to_i
    end

    case
    when @incoin == 1
      @coin -= 10
    when @incoin == 2
      @coin -= 30
    when @incoin == 3
      @coin -= 50
    end

    if (@incoin == 4)
      puts "お疲れ様です"
      exit
    end
    puts "エンターを３回押しましょう"
    enter1 = gets.to_i
    slotNum1
    enter2 = gets.to_i
    slotNum2
    enter3 = gets.to_i
    slotNum3
    puts "--------------"
  end

  def regame
    while @coin > 0
      play(@coin,@point)
      slotResult
    end
    puts "お金が無いです"
  end

end
slNum = SlotNum.new()
slNum.play(100,0)
slNum.slotResult
slNum.regame
