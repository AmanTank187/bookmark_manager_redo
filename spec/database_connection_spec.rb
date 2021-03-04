require 'database_connection'

describe DatabaseConnection do 
    describe '.setup' do
        it ' Sets up a connection to a database through PG' do
            expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

            DatabaseConnection.setup('bookmark_manager_test')
        end 

        it 'The connection is persistent' do
            initialconnection = DatabaseConnection.setup('bookmark_manager_test')

            expect(DatabaseConnection.connection).to eq initialconnection
        end 
    end 

    describe '.query' do
        it 'Executes a query via PG' do
            connection = DatabaseConnection.setup('bookmark_manager_test')
            expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")

            DatabaseConnection.query("SELECT * FROM bookmarks;")
        end 
    end 
end 