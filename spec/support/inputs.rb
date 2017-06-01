describe MyInput, type: :view do
  describe '#input' do
    subject do
      view.simple_form_for(my_object, url: "stub") do |f|
        f.input(:title, as: :title)
        f.input(:about, as: :about)
        f.input(:text, as: :text)
      end
    end
  end
  end
