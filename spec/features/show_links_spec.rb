feature 'Homepage shows a list of links' do
  before do
    initialize_database

    class TestData
      include DataMapper::Resource

      property :id, Serial
      property :link, String
    end
     
    finalize_database

    @link = TestData.create(link: 'www.google.com')
  end

  scenario 'shows list of urls' do
    visit('/')
    expect(page).to have_content('www.google.co.uk')
  end
  
  after do
    @link.destroy
  end
end
