class Question < ActiveRecord::Base
  acts_as_nested_set
#  extend NestedSetPrintability
  # to get "list-like" options for the nested_set, see http://www.vaporbase.com/postings/List_methods_for_nested_sets
  # the functionality is here, it's just wrapping the methods for a different mental model  
  # un-needed acts_as_list # TODO :scope => :bc_module?
end
