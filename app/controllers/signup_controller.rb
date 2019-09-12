class SignupController < ApplicationController

  def signup
    render layout: 'form_layout'
  end

  def first
    render layout: 'layout_1'
  end

  def second
    render layout: 'layout_2'
  end

  def third
    render layout: 'layout_3'
  end

  def fourth
    render layout: 'layout_4'
  end

  def fifth
    render layout: 'layout_5'
  end

  def signin
    render layout: 'form_layout'
  end

end
