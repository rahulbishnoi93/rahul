
require 'DBI'
require 'mysql'
class Employee < SourceAdapter
  @@query = 'SELECT id,name FROM employee'
  @@create = 'INSERT INTO employee(id,name) VALUES(?,?)' 
  @@update = 'UPDATE employee SET name= WHERE id = ?'
  @@delete = 'DELETE FROM employee WHERE id = ?'
  @@url = 'DBI:mysql:final:localhost'
  @@user = 'root'
  @@pwd = 'root'
  def initialize(source) 
    super(source)
  end
 
  def login
    # TODO: Login to your data source here if necessary
    @dbh = DBI.connect(@@url,@@user,@@pwd)
  end
 
  def query(params=nil)
    # TODO: Query your backend data source and assign the records 
    # to a nested hash structure called @result. For example:
    # @result = { 
    #   "1"=>{"name"=>"Acme", "industry"=>"Electronics"},
    #   "2"=>{"name"=>"Best", "industry"=>"Software"}
    # }
    @result={}
      sth = @dbh.prepare(@@query)
      sth.execute()
      sth.fetch do |row|
        item={}
          id = row[0]
          item[:id] = row[0]
            item[:name] = row[1]
              @result[id.to_s] = item
      end
    sth.finish()
  end

  def create(create_hash)
    # TODO: Create a new record in your backend data source
    sth = @dbh.prepare(@@create)
    sth.execute(create_hash['id'],create_hash['name'])
      sth.finish()
      create_hash['id']
  end
 
  def update(update_hash)
    # TODO: Update an existing record in your backend data source
    sth = @dbh.prepare(@@update)
        sth.execute(update_hash['id'],update_hash['name'])
          sth.finish()
  end
 
  def delete(delete_hash)
    # TODO: write some code here if applicable
    # be sure to have a hash key and value for "object"
    # for now, we'll say that its OK to not have a delete operation
    # raise "Please provide some code to delete a single object in the backend application using the object_id"
    sth = @dbh.prepare(@@delete)
        sth.execute(delete_hash['id'],delete_hash['name'])
          sth.finish()
  end
 
  def logoff
    # TODO: Logout from the data source if necessary
    @dbh.disconnect() if @dbh
  end

  def store_blob(object,field_name,blob)
    # TODO: Handle post requests for blobs here.
    # make sure you store the blob object somewhere permanently
    raise "Please provide some code to handle blobs if you are using them."
  end
end