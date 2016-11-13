
--  DESCRIPTION
-- 
--  Calculate and print Pascal's triangle.
--    Define new array type.
--    Create a new procedure to print the triangle.



with  ada.text_io;
use   ada.text_io;



-- main procedure
procedure triangle is

  -- create a new data type, a 2-dimensional matrix of integers
  type MATI is array ( INTEGER range <>, INTEGER range<> ) of INTEGER;

  --  declare 2 instances of that matrix with dimensions 10x10
  tri, tri2 : MATI( 1..10, 1..10 );
  tri35 : MATI(1..3,1..5);


  --  print a 2 dimensional array
  --  assuming that matrix contains only 2 digit integers
  procedure print_mat ( tri : in  MATI; m,n  : in  INTEGER ) is
  begin
  
    put_line("");
    for i in 1..m loop
      for j in 1..n loop
        put( " " & INTEGER'image( tri(i,j) ) & " ");
      end loop;
      put_line("");
    end loop;
    put_line("");
    
  end print_mat;

  -- set all elements of 2 dimensional array to given number
  procedure set_to ( tri : in out MATI; m,n,val : INTEGER ) is
  begin
    for i in 1..m loop
      for j in 1..n loop
        tri( i,j ) := val;
      end loop;
    end loop;
  end set_to;



  -- calculate pascal's triangle
  procedure pascal ( pasc : in out MATI; n : INTEGER ) is
  begin
    
    pasc(1,1) := 1;
    pasc(2,1) := 1;
    pasc(2,2) := 1;
    
    for i in 3..n loop
      pasc( i,1 ) := 1;
      pasc( i,n ):= 1;
      for j in 2..n loop
        pasc(i,j) := pasc( i-1,j-1 ) + pasc(i-1,j);
      end loop;
    end loop;
    
  end pascal;




  -- print pascal's triangle
  procedure print_pasc ( tri : in MATI; n: INTEGER ) is
  begin
    put_line("");
    
    for i in 1..n loop
      -- padding
      for k in 1..n-i loop
        put("   ");
      end loop;      
      
      for j in 1..i loop
        if tri(i,j)<10 then
          put("  " & INTEGER'image(tri(i,j)) );
        elsif tri(i,j)<100 then
          put(" " & INTEGER'image(tri(i,j)) );
        else
          put( INTEGER'image(tri(i,j)) );
        end if;
        put("  ");
      end loop;
      
      put_line("");
    end loop;
    
    put_line("");
  end print_pasc;



begin

    -- initialization, prints, and checks
    --~ set_to( tri, 10, 10, 0 );   -- initialize to all zero
    --~ print_mat( tri, 10, 10 );   -- print matrix
    --~ tri2 := tri;                -- 'copy' matrix tri to tri2
    --~ print_mat( tri, 10 , 10);   -- print tri2
    --~ set_to( val=>5, tri=>tri, m=>10, n=>10 ); -- set to 5
    --~ print_mat( m=>10, n=>10, tri=>tri );    -- reprint to show the change
    
    --~ set_to( tri35, 3, 5, 2 );
    --~ tri35( 2, 1..3) := (7,8,9, others=>0);
    --~ print_mat( tri35, 3, 5 );
    
    pascal( tri2, 10 );
    --~ print_mat( tri2, 10, 10 );
    print_pasc( tri2,10 );
    
    
end triangle;
