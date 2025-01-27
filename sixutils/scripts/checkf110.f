      program checkf110
      implicit none
      double precision prob(60),prob1(60)
      integer line,word
      logical diff,diffs
! Now compare the closed orbit in 53-60 as well
      line=0
      diff=.false.
      diffs=.false.
    1 read (20,end=100,err=98) prob
      line=line+1
      read (21,end=99,err=97) prob1
      if (diffs) diff=.true.
      diffs=.false.
      do word=1,51
        if (prob(word).ne.prob1(word)) diffs=.true.
      enddo 
      do word=53,60
        if (prob(word).ne.prob1(word)) diffs=.true.
      enddo 
      if (diffs) then
        write (*,*)
        write (*,*) "DIFF fort.10, line",line
        do word=1,51
          if (prob(word).ne.prob1(word)) then
            write (*,*) "DIFF",word,prob(word),prob1(word)
          else
            write (*,*) "SAME",word,prob(word)
          endif
        enddo
        do word=53,60
          if (prob(word).ne.prob1(word)) then
            write (*,*) "DIFF",word,prob(word),prob1(word)
          else
            write (*,*) "SAME",word,prob(word)
          endif
        enddo
        write (*,*)
      else
        write (*,*) "SAME fort.10, line",line
      endif
      go to 1
 99   continue
      write (*,*) "Comparing VERSION ",prob(52)," to ",prob1(52)
      write (*,*) "DIFF I/O error, wrong no of lines!! line no ",line
      stop
 98   continue
      write (*,*) "Comparing VERSION ",prob(52)," to ",prob1(52)
      write (*,*) "DIFF I/O error!! fort.20 line no ",line
      stop
 97   continue
      write (*,*) "Comparing VERSION ",prob(52)," to ",prob1(52)
      write (*,*) "DIFF I/O error!! fort.21 line no ",line
      stop
 100  continue
      if (line.eq.0) go to 99
      write (*,*) "Comparing VERSION ",prob(52)," to ",prob1(52)
      if (diff) then
        write (*,*) "DIFF after comparing ",line ,"lines"
      else
        write (*,*) "SAME after comparing ",line ,"lines"
      endif
      end
