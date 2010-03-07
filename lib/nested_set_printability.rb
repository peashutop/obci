module NestedSetPrintability

  # prints tree with one sql query
  #from http://stackoverflow.com/questions/1372366/how-to-render-all-records-from-a-nested-set-into-a-real-html-tree
  #accepts an array of AwesomeNestedSet-enabled objects as its input; most be sorted by lft
  
  # CLASS METHODS, all!
  
  def tree_from_set(set) #set must be in order
    buf = START_TAG(set[0])
    stack = []
    stack.push set[0]
    set[1..-1].each do |node|
      if stack.last.lft < node.lft < stack.last.rgt
        if node.leaf? #(node.rgt - node.lft == 1)
          buf << NODE_TAG(node)
        else
          buf << START_TAG(node)
          stack.push(node)
        end
      else
        buf << END_TAG
        stack.pop
        retry
      end
    end
    buf <<END_TAG
  end

  def START_TAG(node) #for example
    "<li><p>#{node.name}</p><ul>"
  end

  def NODE_TAG(node)
    "<li><p>#{node.name}</p></li>"
  end

  def END_TAG
    "</li></ul>"
  end

end
  
