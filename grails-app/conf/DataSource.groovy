    dataSource {
    pooled = true
    driverClassName = "org.postgresql.Driver"
    username = "postgres"
    password = "postgres"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        /*dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:h2:mem:devDb;MVCC=TRUE"
        }*/
        
        // relative to web-app
	//jasper.dir.reports = '../src/reports'
            
        dataSource {
            dbCreate = "create" // one of 'create', 'create-drop','update'
            driverClassName = "org.postgresql.Driver"
            url = "jdbc:postgresql://localhost:5432/ekklesis"
            dialect = org.hibernate.dialect.PostgreSQLDialect
            username = "postgres"
            password = "postgres" 
        }
            
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:postgresql:testDb;MVCC=TRUE"
        }
    }
    production {
        
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            driverClassName = "org.postgresql.Driver"
            url = "jdbc:postgresql://localhost:5432/ekklesis"
            dialect = org.hibernate.dialect.PostgreSQLDialect
            username = "postgres"
            password = "postgres" 
        }
            
        /*dataSource {
            dbCreate = "update"
            url = "jdbc:postgresql:prodDb;MVCC=TRUE"
            pooled = true
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }*/
    }
}
