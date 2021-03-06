module outputEncoder (CLK,CLR,cond,state, moc, ir, RFLd, IRLd, MARLd, MDRLd, RW, MOV, typeData,px, FRLd, MA1, MA0, MB1, MB0, MC2, MC1, MC0, MD, ME,MF1, MF0, MG,MH, MI1,MI0,MJ1,MJ0, E, T2, T1,T0,S5,S4,S3,S2,S1,S0, OP4, OP3, OP2, OP1, OP0);
output reg RFLd;
output reg IRLd;
output reg MARLd;
output reg MDRLd;
output reg RW;
output reg MOV;
output reg [1:0]typeData; 
output reg [3:0]px; 
output reg FRLd;
output reg MA1;
output reg MA0;
output reg MB1;
output reg MB0;
output reg MC2;
output reg MC1;
output reg MC0;
output reg MD;
output reg ME;
output reg MG;
output reg MF0;
output reg MF1;
output reg MH;
output reg MI0;
output reg MI1;
output reg MJ0;
output reg MJ1;
output reg T2,T1,T0;
output reg E;
output reg CLR;
output reg S5,S4,S3,S2,S1,S0, OP4, OP3, OP2, OP1, OP0;
input [6:0] state;
input cond; 
input CLK;
input [31:0] ir;
input moc; 

always@(state)
	begin
		if (state == 0) 
		begin
				RFLd <= 0;IRLd<= 0;MARLd<= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			    CLR   <= 1;
		end
		else if (state == 6'd1) 
		begin
		    RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			MARLd    <= 1;
			RW		 <= 1;
			MA1 	 <= 1;
			MD  	 <= 1;
			OP4      <= 1;
		end
		else if (state == 6'd2) 
		begin
		RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			RFLd     <= 1;
			RW       <= 1;
			MOV      <= 1;
			typeData <= 2'b10;
			MA1 	 <= 1;
			MC1 	 <= 1;
			MC0 	 <= 1;
			MD  	 <= 1;
			OP4      <= 1; 
			OP0      <= 1;
		end
		else if (state == 6'd3)
		begin
		   RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			IRLd     <= 1;
			RW       <= 1;
			MOV      <= 1;
			typeData <= 2'b10; 
		end
		else if (state == 6'd4) 
		begin
		RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;	
		end	
		else if (state == 6'd5) 
		begin
		RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
		    RFLd     <= 1;
			MB0		 <= 1; 
			MC2 	 <= 1;
			MF1 	 <= 1;
			MF0 	 <= 1;
			MD       <= 1;
			T0 		 <= 1;
			E 		 <= 1;
			OP4  	 <= 1;
			OP1      <= 1; 
			OP0 	 <= 1;	
		end
		else if (state == 6'd6) 
		begin
		RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			RFLd     <= 1;
			MI1		 <= 1;
			MJ0 	 <= 1;
			T2 		 <= 1;
			if(ir[20])
				FRLd <= 1;				
		end
		else if (state == 6'd7)
		begin
		RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			RFLd     <= 1;
			MB0		 <= 1; 
			MH  	 <= 1;
			MI0		 <= 1;
			S4		 <= ir[11];
			S3		 <= ir[10];
			S2		 <= ir[9];
			S1		 <= ir[8];
			S0		 <= ir[7];
			if(ir[20])
				FRLd <= 1;			
		end	
		else if (state == 6'd8) 
		begin
		RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			RFLd     <= 1;
			MB0		 <= 1; 
			FRLd	 <= 1;
			MC2      <= 1;
			MD  	 <= 1;
			MF1 	 <= 1; 
			MF0		 <= 1;
			MI1		 <= 1;
			MJ1		 <= 1;
			E		 <= 1;
			T2		 <= 1; 
			OP4		 <= 1;
			OP1		 <= 1; 
			OP0		 <= 1;
			
		end	
		else if (state == 6'd9)
		begin
		RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			RFLd <= 1;
			MA1	 <= 1;
			MC1	 <= 1; 
			MC0	 <= 1;
			MB0	 <= 1;
			MD   <= 1;
			MI1	 <= 1;
			T2	 <= 1;
			T0	 <= 1;
			MJ0  <= 1; 
			S2 	 <= 1; 
			OP2  <= 1;  
		end
		else if(state == 6'd10)
		begin
		RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			RFLd <= 1; 
			MA1  <= 1; 
			MA0  <= 1;
			MC1  <= 1; 
			MD   <= 1;
			MJ0  <= 1; 
			S2   <= 1; 
			OP4  <= 1;
			
		end
		else if (state == 6'd33) 
		begin
		RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			MARLd    <= 1;
			MB0  	 <= 1;
			MF0      <= 1;
			MF1      <= 1;
			E        <= 1;
			T0		 <= 1;
			T1		 <= 0;
			T2		 <= 1;
			MD 	     <= 1;
			MI1 	 <= 1;
			OP2  	 <= 1;
			
		end	
		else if (state == 6'd34) 
		begin
			RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			RW       <= 1;
			MOV  	 <= 1;
			typeData <= 2'b10;
			MI1 	 <= 1;
			
		end	
		else if (state == 6'd35) 
		begin
		RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			MDRLd    <= 1;
			RW  	 <= 1;
			MOV      <= 1;
			MB1 	 <= 1;
			MI1 	 <= 1;
			
		end	
		else if (state == 6'd36) 
		begin
		RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			RFLd     <= 1;
			MB1 	 <= 1;
			MI1 	 <= 1;
			MD 		 <= 1;
			OP4 	 <= 1;
			OP1		 <= 1;
			OP0 	 <= 1;
			
		end	
		else if (state == 6'd37) 
		begin
		RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			MARLd    <= 1;
			MD 		 <= 1;
			MI1 	 <= 1;
			OP2		 <= 1;			 
		end	
		else if (state == 6'd38) 
		begin
		RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
		    RFLd     <= 1;
			MB0	 	 <= 1;
			MC0	 	 <= 1;
			MD 		 <= 1;
			E		 <= 1;
			MI1 	 <= 1;
			OP2		 <= 1;
			MF1		 <= 1;
			MF0		 <= 1;
			T2		 <= 1;
			T0		 <= 1;	
		end	
		else if (state == 6'd39) 
		begin
		RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			RFLd     <= 1;
			MC0		 <= 1;
			MD     	 <= 1;
			MI1		 <= 1;
			OP2		 <= 1;
			
		end	else if (state == 6'd40) 
		begin
		RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			MARLd    <= 1;
			MB1 	 <= 1;
			MB0	 	 <= 1;
			MD 	 	 <= 1;
			MI1		 <= 1;
			OP4 	 <= 1;		
		end	
		else if (state == 6'd41) 
		begin
		RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			MDRLd    <= 1;
			MB1	 	 <= 1;
			MA0		 <= 1;
			MB0	 	 <= 1;
			MD 	     <= 1;
			ME		 <= 1;
			MI1		 <= 1;
			OP4	     <= 1;
			
		end	
		else if (state == 6'd42) 
		begin
			RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			MOV      <= 1;
			typeData <= 2'b10;
			MI1 	 <= 1;
		
		end	
		else if (state == 6'd43) 
		begin
		RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			// MOV  <= 1;
			
		end	
		else if (state == 6'd44) 
		begin
		RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			RW	 	 <= 1;
			MOV	 	 <= 1;
			MI1 	 <= 1;
		end	
		else if (state == 6'd45) 
		begin
		RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			MOV		<= 1; 
			//MG		<= 1; 
			MI1 	<= 1;
			MF1		<= 1;
			T2 		<= 1; 
			T1 		<= 1;  						
		end	
		else if (state == 6'd46) 
		begin
		RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			MARLd    <= 1;
			MB0  	 <= 1;
			MF0      <= 1;
			MF1      <= 1;
			E        <= 1;
			T0		 <= 1;
			T1		 <= 0;
			T2		 <= 1;
			MD 	     <= 1;
			MI1 	 <= 1;
			OP1	     <= 1;
		end	
		else if (state == 6'd47) 
		begin
		RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			MARLd    <= 1;
			MD 	     <= 1;
			MI1		 <= 1;
			OP1	     <= 1;
		end
		else if (state == 6'd48) 
		begin
		RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			RFLd     <= 1;
			MB0	     <= 1;
			MC0		 <= 1;
			MD     	 <= 1;
			E		 <= 1;
			MI1		 <= 1;
			OP1 	 <= 1;
			MF1		 <= 1;
			MF0		 <= 1;
			T2		 <= 1;
			T0		 <= 1;
			
		end
		else if (state == 6'd49) 
		begin
		RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
			RFLd     <= 1;
			MC0		 <= 1;
			MD     	 <= 1;
			MI1		 <= 1;
			OP1 	 <= 1;
			
		end
		else if(state == 6'd50)
			begin
			RFLd <= 0;IRLd<= 0;MARLd<= 0;CLR   <= 0;MDRLd<= 0;E = 0;RW<= 0;MOV <=0;typeData <=0;px<= 4'b0000;FRLd<=0;MA1<=0;MA0<= 0;MB1<= 0;MB0<=0;MC2<= 0;MC1<= 0;MC0<= 0;MD <= 0;ME<= 0;MF1<=0;MF0<= 0;MG <= 0;MH<=0;MI1<=0;MI0<= 0;MJ1 <=0;MJ0<= 0;T0 <= 0;T1 <= 0;T2 <=0;S5 <= 0;S4 <=0;S3<= 0;S2<= 0;S1<= 0;S0<= 0;OP4<= 0;OP3 <= 0;OP2 <= 0;OP1 <= 0;OP0 <= 0;
				RFLd 	  <= 1;
				MB0       <= 1;
				MC0       <= 1;
				MF1       <= 1;
				MD        <= 1;
				MI1       <= 1;
				E         <= 1; 
				T0        <= 1; 
				OP4       <= 1; 
				OP1       <= 1;
				OP0       <= 1;	
			end
	end
endmodule