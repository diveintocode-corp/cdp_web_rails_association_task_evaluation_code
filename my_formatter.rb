class MyFormatter
  RSpec::Core::Formatters.register self, :example_passed, :example_failed, :example_group_started, :start
  def initialize(output)
    @output = output
    @check_list = [
      "Association with addressable",
      "Association with order",
      "Association with shop",
      "Association with order_food",
      "Association with order",
      "Association with address",
      "Association with order",
      "Association with shop",
      "Association with order_food",
      "Association with order",
      "Association with shop",
      "Association with order_food",
      "Association with order",
      "Association with shop",
      "Association with order_food",
      "Association with order",
      "Association with food",
      "Association with order",
      "Association with address",
      "Association with customer",
      "Association with order_food",
      "Association with food",
      "Association with address",
      "association with food",
    ]
    @n = 0
  end

  def start(notification)
    @output << "---\ntitle: Feedback on the assignment\n---\n"
  end

  def example_passed(notification)
    @output << "- ✅ #{@check_list[@n]}\n"
    @n += 1
  end

  def example_group_started(notification)
    if notification.group.to_s.count(':') == 4
      @output << "# #{notification.group.description}\n"
    elsif notification.group.to_s.count(':') == 8
      @output << "### #{notification.group.description}\n"
    end
  end

  def example_failed(notification)
    @output << "- [ ] ❌ #{@check_list[@n]}\n"
    @n += 1
  end
end
