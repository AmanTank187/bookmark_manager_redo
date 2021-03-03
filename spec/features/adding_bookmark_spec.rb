feature 'Add a new bookmark' do 
    scenario 'Visiting the bookmark/new page and adding a bookmark' do
        connection = PG.connect(dbname: 'bookmark_manager_test')
        visit ('/bookmarks/new')
        fill_in('url', :with => 'http://testbookmark.com')
        fill_in('title', :with => 'Test Bookmark')
        click_button('Submit')
        visit('/bookmarks')
        expect(page).to have_link('Test Bookmark', href: 'http://testbookmark.com')
    end 
end 