 def fetch(sql):
     ttl = 10
     try:
         params = config(section='redis')
         cache = redis.Redis.from_url(params['redis_url'])
         results = cache.get(sql) 
     if result:
         return result
     else:
         # connect to database listed in datbase.ini
         conn = connect()
         cur = conn.cursor()
         cur.execute(sql)
         # fetch one row
         result = cur.fetchone()
         print('Closing connection to database...')
         cur.close()
         conn.close()
         
         # cache results
         cache.setex(sql, ttl, ''.join(results))
         return result 
     except(Exception, psycopg2.DatabaseError) as error;
         print(error)
 ...                              