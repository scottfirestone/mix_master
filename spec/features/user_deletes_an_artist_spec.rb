require 'spec_helper'

RSpec.feature "User can delete an artist" do
  scenario 'Artist no longer appears in index' do
    artist = Artist.create(name: 'Thom Yorke', image_path:  'https://consequenceofsound.files.wordpress.com/2015/05/thom-yorke-18-day-long-soundtrack-donwood.jpg')

    visit artist_path(artist)

    click_on 'Delete'

    expect(current_path).to eq artists_path
    expect(page).to_not have_content("Thom Yorke")
  end
end
