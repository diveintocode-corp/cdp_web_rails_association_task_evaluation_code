class MyFormatter
  RSpec::Core::Formatters.register self, :example_passed, :example_failed, :example_group_started, :start
  def initialize(output)
    @output = output
    @n = 0
  end

  def start(notification)
    @output << "---\ntitle: 課題評価のフィードバック\n---\n"
  end

  def example_passed(notification)
    @output << "- ✅ #{notification.example.description}\n"
  end

  def example_group_started(notification)
    if notification.group.to_s.count(':') == 4
      @output << "# #{notification.group.description}\n"
    elsif notification.group.to_s.count(':') == 8
      @output << "### #{notification.group.description}\n"
    end
  end

  def example_failed(notification)
    check_list = [
      "addressableとのアソシエーション",
      "orderとのアソシエーション",
      "shopとのアソシエーション",
      "order_foodとのアソシエーション",
      "orderとのアソシエーション",
      "addressとのアソシエーション",
      "orderとのアソシエーション",
      "shopとのアソシエーション",
      "order_foodとのアソシエーション",
      "orderとのアソシエーション",
      "shopとのアソシエーション",
      "order_foodとのアソシエーション",
      "orderとのアソシエーション",
      "shopとのアソシエーション",
      "order_foodとのアソシエーション",
      "orderとのアソシエーション",
      "foodとのアソシエーション",
      "orderとのアソシエーション",
      "addressとのアソシエーション",
      "customerとのアソシエーション",
      "order_foodとのアソシエーション",
      "foodとのアソシエーション",
      "addressとのアソシエーション",
      "foodとのアソシエーション",
    ]
    @output << "- [ ] ❌ #{check_list[@n]}\n"
    @n += 1
  end
end
