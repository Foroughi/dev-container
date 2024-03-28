function exists(file)
   local ok, err, code = os.rename(file, file)
   if not ok then
      if code == 13 then
         -- Permission denied, but it exists
         return true
      end
   end
   return ok, err
end


local localNvimExits , err = exists(vim.fn.getcwd() .. "/.nvim/local-init.lua")
if localNvimExits then
               
        package.path = vim.fn.getcwd() .. "/.nvim/?.lua;" .. vim.fn.getcwd() .. "/.nvim/lua/?.lua;" .. package.path;
        require("local-init");
   
end
