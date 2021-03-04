feature 'Delete a bookmark' do
    scenario 'Deleting a bookmark from the page' do
        Bookmark.create(url: 'https://makers.tech/',title: 'Makers Academy')
        visit ('/bookmarks')
        expect(page).to have_link('Makers Academy', href: 'https://makers.tech/')

        first('.bookmark').click_button 'Delete'

        expect(current_path).to eq '/bookmarks'
        expect(page).not_to have_link('Makers Academy', href: 'http//www.makersacademy.com')
    end 
end 