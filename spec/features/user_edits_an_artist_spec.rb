require 'spec_helper'

RSpec.feature "User edits an artist" do
  scenario 'They see the updated data for the individual artist' do
    artist = Artist.create(name: 'Thom Yorke', image_path: 'https://consequenceofsound.files.wordpress.com/2015/05/thom-yorke-18-day-long-soundtrack-donwood.jpg')
    new_name = 'Jonny Greenwood'

    visit artist_path(artist)

    click_on 'Edit'

    fill_in 'artist_name', with: new_name

    click_on 'Update Artist'

    expect(page).to have_content new_name
    expect(page).to_not have_content artist.name
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  end
end
