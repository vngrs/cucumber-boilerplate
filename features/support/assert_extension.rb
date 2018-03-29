class AssertExtension

  def assert_displayed(element)
    assert_true(element.displayed?, 'Element should be displayed!')
  end
end