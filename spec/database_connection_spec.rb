require 'database_connection'

describe DatabaseConnection do
  context '.setup' do
    it 'can setup a connection through PG' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_test_manager')

      DatabaseConnection.setup('bookmark_test_manager')
    end

    it 'can return the connection later' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end 


  context '.query' do
    it 'can query from the database' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(connection).to receive(:exec).with('SELECT * FROM bookmarks;')

      DatabaseConnection.query('SELECT * FROM bookmarks;')
    end
  end
end