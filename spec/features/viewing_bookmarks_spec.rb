feature 'Viewing bookmarks' do 
    scenario 'Visiting the bookmark page and seeing a bookmark' do
        visit('/bookmarks')
        
        expect(page).to have_content "http://www.makersacademy.com"
        expect(page).to have_content "http://www.destroyallsoftware.com"
        expect(page).to have_content "http://www.google.com"
    end
end 