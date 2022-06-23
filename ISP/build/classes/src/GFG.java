class GFG
{
    public static void main (String[] args)
    {
        int s = 12, m = 5;
    
        
        if (s == 0)
        {
            System.out.print(m == 1 ? "Largest number is 0" : "Not possible");
             
            return ;
        }
  
       
        if (s > 9*m)
        {
            System.out.println("Not possible");
            return ;
        }
  
        // Create an array to store digits of result
        int[] res = new int[m];
  
        
        for (int i=0; i<m; i++)
        {
            
            if (s >= 9)
            {
                res[i] = 9;
                s -= 9;
            }
  
            
            else
            {
                res[i] = s;
                s = 0;
            }
        }
  
        System.out.print("Largest number is ");
        for (int i=0; i<m; i++)
            System.out.print(res[i]);
 
     
    
   
        
    }
}