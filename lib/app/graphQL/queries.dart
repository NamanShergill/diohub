class GraphQLQueries {
  static String getPinnedRepos = r'''
      query{ 
                user(login: "knmn2000") { 
                  pinnedItems(first: 6, types:[REPOSITORY]){
                    edges{
                      node{
                        ... on Repository{
                          name
                          description
                          languages(first: 1){
                            edges{
                              node{
                                name
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }''';
}
