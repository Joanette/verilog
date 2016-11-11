module controlUnit (RFLd, IRLd, MARLd, MDRLd, RW, MOV, typeData,px, FRLd, MA1, MA0, MB1, MB0, MC1, MC0, MD, ME,MF, MG,MH, MI0,MI1, E, T1,T0,S5,S4,S3,S2,S1,S0, OP4, OP3, OP2, OP1, OP0, state);
output reg RFLd;
output reg IRLd;
output reg MARLd;
output reg MDRLd;
output reg RW;
output reg MOV;
output reg typeData; 
output reg [0:3]px; 
output reg FRLd;
output reg MA1;
output reg MA0;
output reg MB1;
output reg MB0;
output reg MC1;
output reg MC0;
output reg MD;
output reg ME;
output reg MG;
output reg MF;
output reg MH;
output reg MI0;
output reg MI1;
output reg T1,T0;
output reg E;
output reg S5,S4,S3,S2,S1,S0, OP4, OP3, OP2, OP1, OP0;
input [6:0]state;
always@(state)
	begin
	//Initializing signals to 0 
		    RFLd     = 0;
			IRLd     = 0;
			MARLd    = 0;
			MDRLd    = 0;
			E 		 = 0;
			RW       = 0;
			MOV      = 0;
			typeData = 0;
			px 		 = 4'b0000;
			FRLd	 = 0;
			MA1 	 = 0;
			MA0 	 = 0;
			MB1 	 = 0;
			MB0 	 = 0;
			MC1 	 = 0;
			MC0 	 = 0;
			MD  	 = 0;
			ME  	 = 0;
			MF 		 = 0;
			MG 		 = 0;
			MH 		 = 0;
			MI1 	 = 0;
			MI0 	 = 0;
			T0		 = 0;
			T1		 = 0;
			S5		 = 0;
			S4		 = 0;
			S3		 = 0;
			S2		 = 0;
			S1		 = 0;
			S0       = 0;
			OP4 	 = 0;
			OP3 	 = 0;
			OP2 	 = 0;
			OP1	 	 = 0;
			OP0 	 = 0;
		if (state == 6'd0) 
		begin
		end
		else if (state == 6'd1) 
		begin
			MARLd    = 1;
			MA1 	 = 1;
			MD  	 = 1;
		end
		else if (state == 6'd2) 
		begin
			RFLd     = 1;
			RW       = 1;
			MOV      = 1;
			MA1 	 = 1;
			MC0 	 = 1;
			MD  	 = 1;
		end
		else if (state == 6'd3)
		begin
			IRLd     = 1;
			RW       = 1;
			MOV      = 1;
		end
		else if (state == 6'd4) 
		begin		
		end	
		else if (state == 6'd5) 
		begin
			RFLd     = 1;
			FRLd	 = 1;
		end	
		else if (state == 6'd6) 
		begin
			RFLd     = 1;
			FRLd	 = 1;
			MB0 	 = 1;
			MH 		 = 1;
			MI0 	 = 1;
		end	
		else if (state == 6'd7)
		begin
			RFLd     = 1;
			FRLd	 = 1;
			MC1 	 = 1;
			MD  	 = 1;
		end	
		else if (state == 6'd8) 
		begin
			RFLd     = 1;
			FRLd	 = 1;
			MC1 	 = 1;
			MC0 	 = 1;
			MD  	 = 1;
		end	
		else if (state == 6'd33) 
		begin
			MARLd    = 1;
			MB0  	 = 1;
			MD 	     = 1;
			MI1 	 = 1;
			OP2  	 = 1;
		end	
		else if (state == 6'd34) 
		begin
			RW       = 1;
			MOV  	 = 1;
			typeData = 2'b10;
			MI1 	 = 1;
		end	
		else if (state == 6'd35) 
		begin
			MDRLd    = 1;
			RW  	 = 1;
			MOV      = 1;
			MB1 	 = 1;
			MI1 	 = 1;
		end	
		else if (state == 6'd36) 
		begin
			RFLd     = 1;
			MB1 	 = 1;
			MI1 	 = 1;
			MD 		 = 1;
			OP4 	 = 1;
			OP1		 = 1;
			OP0 	 = 1;
		end	
		else if (state == 6'd37) 
		begin
			MARLd    = 1;
			RW	 	 = 1;
			MB0	 	 = 1;
			MD 		 = 1;
			MI1 	 = 1;
			OP2		 = 1;
		end	
		else if (state == 6'd38) 
		begin
			RFLd    = 1;
			MB0	 	 = 1;
			MC0	 	 = 1;
			MD 		 = 1;
			MI1 	 = 1;
			OP2		 = 1;
		end	
		else if (state == 6'd39) 
		begin
			RFLd    = 1;
			MC0	 	 = 1;
			MD	 	 = 1;
			MI1 	 = 1;
			OP2		 = 1;
		end	else if (state == 6'd40) 
		begin
			MARLd    = 1;
			MB1 	 = 1;
			MB0	 	 = 1;
			MD 	 	 = 1;
			MI1		 = 1;
			OP4 	 = 1;
		end	
		else if (state == 6'd41) 
		begin
			MDRLd    = 1;
			MB1	 	 = 1;
			MB0	 	 = 1;
			MD 	     = 1;
			ME		 = 1;
			MI1		 = 1;
			OP4	     = 1;
		end	
		else if (state == 6'd42) 
		begin
			MOV      = 1;
			typeData = 2'b10;
			MG	 	 = 1;
			MI1 	 = 1;
			T1 		 = 1;
			T0		 = 1;
			S5		 = 1;
		end	
		else if (state == 6'd43) 
		begin
			MOV      = 1;
		end	
		else if (state == 6'd44) 
		begin
			RW	 	 = 1;
			MOV	 	 = 1;
			MI1 	 = 1;
		end	
		else if (state == 6'd45) 
		begin
			MH 		 = 1;
			MI1	     = 1; 
		end	
		else if (state == 6'd46) 
		begin
			MARLd    = 1;
			MB0	 	 = 1;
			MD 	     = 1;
			MI1		 = 1;
			OP1	     = 1;
		end	
		else if (state == 6'd47) 
		begin
			MARLd    = 1;
			MD 	     = 1;
			MI1		 = 1;
			OP1	     = 1;
		end
		else if (state == 6'd48) 
		begin
			RFLd     = 1;
			MB0	     = 1;
			MC0		 = 1;
			MD     	 = 1;
			MI1		 = 1;
			OP1 	 = 1;
		end
		else if (state == 6'd49) 
		begin
			RFLd     = 1;
			MC0		 = 1;
			MD     	 = 1;
			MI1		 = 1;
			OP2 	 = 1;
		end
	end
endmodule