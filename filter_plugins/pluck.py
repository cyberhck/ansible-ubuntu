def pluck(collection, key):
     '''
     extract x[key] for every item x in the collection
     '''

     plucked = []
     print(collection)

     for x in collection:
        try:
            plucked.append(x[key])
        except KeyError:
            pass

     return plucked

def exists(collection, value):
    for x in collection:
        if x == value:
            return True
    return False

class FilterModule(object):
    '''
    custom jinja2 filters for working with collections
    '''

    def filters(self):
        return {
            'pluck': pluck,
            'exists': exists
        }
