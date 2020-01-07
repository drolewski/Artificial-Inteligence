/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package put.ai.games.pentagoPlayer;

import java.util.List;
import put.ai.games.game.Board;
import put.ai.games.game.Move;
import put.ai.games.game.Player;

public class pentagoPlayer extends Player {

	@Override
	public String getName() {
		return "Borys Czachowski 132204 Dominik Rolewski 136792";
	}

	@Override
    public Move nextMove(Board board) {
        Color myColor = getColor();
        List<Move> listOfMoves = board.getMovesFor(myColor);
        Board boardClone = board.clone();
        
        boolean start = false;
        int max = 0, maxOnBranch = 0;
        int countMoves = movesCounter(board);
        int depth;
        if(countMoves % 2 == 1) {
        	depth = 3;
        	start = false;
        }else {
        	depth = 1;
        	start = true;
        }
        int alpha = Integer.MIN_VALUE;
        int beta = Integer.MAX_VALUE;
        for(int branch = 0; branch < listOfMoves.size(); branch++) {
        	boardClone.doMove(listOfMoves.get(branch));
        	int quality = min_max(boardClone, getOpponent(myColor), depth - 1, 1, alpha, beta, start);
        	boardClone.undoMove(listOfMoves.get(branch));
        	if(max < quality) {
        		max = quality;
        		maxOnBranch = branch;
        	}
        	alpha = max(quality, alpha);
        }
        
        return listOfMoves.get(maxOnBranch);
    }

	public int movesCounter(Board board) {
		int n = board.getSize();
		int moves = 0;
		for (int x = 0; x < n; x++) {
			for (int y = 0; y < n; y++) {
				if (board.getState(x, y) != Color.EMPTY)
					moves++;
			}
		}
		return moves;
	}
	
	public int max(int first , int second) {
		return (first >= second) ? first : second;
	}

	public int min(int first , int second) {
		return (first <= second) ? first : second;
	}
	
	public int min_max(Board board, Color myColor, int depth, int function, int alpha, int beta, boolean start) {
		if(depth > 0 && board.getWinner(myColor) == null) {
			if(function == 0) {
				List<Move> listOfMoves = board.getMovesFor(myColor);
				for(int i = 0; i < listOfMoves.size(); i++) {
					board.doMove(listOfMoves.get(i));
					int quality = min_max(board, getOpponent(myColor), depth - 1, 1, alpha, beta, start);
					board.undoMove(listOfMoves.get(i));
					
					alpha = max(quality, alpha);
					if(alpha >= beta) return beta;
				}
				return alpha;
			}else {
				List<Move> listOfMoves = board.getMovesFor(myColor);
				for(int i = 0; i < board.getSize(); i++) {
					board.doMove(listOfMoves.get(i));
					int quality = min_max(board, getOpponent(myColor), depth - 1, 0, alpha, beta, start);
					board.undoMove(listOfMoves.get(i));
					
					beta = min(quality, beta);
					if(alpha >= beta) return beta;
				}
				return beta;
			}
		}else {
			return calculateQuality(board, start);
		}
	}
	
	public int calculateQuality(Board board, boolean start) {
		Color myColor = getColor();
		Color opponentColor = getOpponent(myColor);
		int n = board.getSize();
		int result = 0;
		int quality;
		if(start) {
			for(int x = 0; x < n; x++) {
				for(int inRow = 2; inRow <= 5; inRow++) {
					for(int first = 0; first <= n - inRow; first++) {
						quality = 0;
						for(int y = first; y < first + inRow; y++) {
							if(board.getState(x,y) == myColor) {
								quality++;
							}else {
								quality = 0;
								break;
							}
						}
						if(quality == inRow && inRow == 2 && (first == 0 || first == 4)) {
							result += 50;
						}else if(quality == inRow && inRow == 2) {
							result += 10;
						}
						if(quality == inRow && inRow == 3) {
							result += 500;
						}
						if(quality == inRow && inRow == 4) {
							result += 1500;
						}
						if(quality == inRow && inRow == 5) {
							result += 100000;
						}
					}
				}
			}
			
			for(int x = 0; x < n; x++) {
				for(int inRow = 2; inRow <= 5; inRow++) {
					for(int first = 0; first <= n - inRow; first++) {
						quality = 0;
						for(int y = first; y < first + inRow; y++) {
							if(board.getState(x,y) == opponentColor) {
								quality++;
							}else {
								quality = 0;
								break;
							}
						}
	
						if(quality == inRow && inRow == 3) {
	        				result -= 500;
	        			}
	        			if(quality == inRow && inRow == 4) {
	        				result -= 1500;
	        			}
	        			if(quality == inRow && inRow == 5) {
	        				result -= 100000;
	        			}
					}
				}
			}
			
			
			for(int y = 0; y < n; y++) {
	    		for(int inColumn = 2; inColumn <= 5; inColumn++) {
	    			for(int first = 0; first <= n - inColumn; first++) {
	        			quality = 0;
	    				for(int x = first; x < first + inColumn; x++) {						
	    					if(board.getState(x, y) == myColor) {
	    						quality++;
	    					}
	        				else {
	        					quality = 0;
	        					break;
	        				}
	    				}
	    				if(quality == inColumn && inColumn == 2 && (first == 0 || first == 4)) {
							result += 50;
						}else if(quality == inColumn && inColumn == 2) {
							result += 10;
						}
						if(quality == inColumn && inColumn == 3) {
							result += 500;
						}
						if(quality == inColumn && inColumn == 4) {
							result += 1500;
						}
						if(quality == inColumn && inColumn == 5) {
							result += 100000;
						}
	    			}
	    		}	
	    	}
	    	
	    	for(int y = 0; y < n; y++) {
	    		for(int inColumn = 2; inColumn <= 5; inColumn++) {
	    			for(int first = 0; first <= n - inColumn; first++) {
	        			quality = 0;
	    				for(int x = first; x < first + inColumn; x++) {
	    					if(board.getState(x, y) == opponentColor) {
	    						quality++;
	    					}
	        				else {
	        					quality = 0;
	        					break;
	        				}
	    				}
	    				if(quality == inColumn && inColumn == 3) {
	        				result -= 500;
	        			}
	        			if(quality == inColumn && inColumn == 4) {
	        				result -= 1500;
	        			}
	        			if(quality == inColumn && inColumn == 5) {
	        				result -= 100000;
	        			}
	    			}
	    		}	
	    	}
			
	    	return result;
		}else {
			int opponentQuality = 0;
    		boolean myStop = false;
    		boolean opponentStop = false;
			
			for(int x = 0; x < n; x++) {
	    		for(int i = 0; i < n; i ++) {
	        		quality = 0;
	        		opponentQuality = 0;
	        		myStop = false;
	        		opponentStop = false;
	        		
	    			for(int y = i; y < i; y++) {
	    				if(board.getState(x, y) == myColor && !myStop) {
	    					quality++;
	    				}
	    				else if(board.getState(x, y) == getOpponent(myColor)) {
	    					myStop = true;
	    				}
	    				if(board.getState(x, y) == getOpponent(myColor) && !opponentStop) {
	    					opponentQuality++;
	    				}
	    				else if(board.getState(x, y) == myColor) {
	    					opponentStop = true;
	    				}
	    			}
	    			
	        		if(myStop) {
	        			quality = 0;
	        		}
	        		if(opponentStop) {
	        			opponentQuality = 0;
	        		}
	        		
	        		if(quality == 2) {
	        			result += 2;
	        		}
	        		if(quality == 3) {
	        			result += 5;
	        		}
	        		if(quality == 4) {
	        			result += 150;
	        		}
	        		if(quality == 5) {
	        			result += 1000;
	        		}
	        		
	        		if(opponentQuality == 2) {
	        			result -= 2;
	        		}
	        		if(opponentQuality == 3) {
	        			result -= 7;
	        		}
	        		if(opponentQuality == 4) {
	        			result -= 170;
	        		}
	        		if(opponentQuality == 5) {
	        			result -= 1500;
	        		}
	    			
	    		}
	    	}
	    	
	    	for(int y = 0; y < n; y++) {
	    		for(int i = 0; i < n ; i ++) {
	        		quality = 0;
	        		opponentQuality = 0;
	        		myStop = false;
	        		opponentStop = false;
	        		
	    			for(int x = i; x < i; x++) {
	    				if(board.getState(x, y) == myColor && !myStop) {
	    					quality++;
	    				}
	    				else if(board.getState(x, y) == getOpponent(myColor)) {
	    					myStop = true;
	    				}
	    				if(board.getState(x, y) == getOpponent(myColor) && !opponentStop) {
	    					opponentQuality++;
	    				}
	    				else if(board.getState(x, y) == myColor) {
	    					opponentStop = true;
	    				}
	    			}
	    			
	        		if(myStop) {
	        			quality = 0;
	        		}
	        		if(opponentStop) {
	        			opponentQuality = 0;
	        		}
	        		
	        		if(quality == 2) {
	        			result += 2;
	        		}
	        		if(quality == 3) {
	        			result += 5;
	        		}
	        		if(quality == 4) {
	        			result += 150;
	        		}
	        		if(quality == 5) {
	        			result += 1000;
	        		}
	        		
	        		if(opponentQuality == 2) {
	        			result -= 2;
	        		}
	        		if(opponentQuality == 3) {
	        			result -= 7;
	        		}
	        		if(opponentQuality == 4) {
	        			result -= 170;
	        		}
	        		if(opponentQuality == 5) {
	        			result -= 1500;
	        		}
	    		}
	    	}			
			return result;
		}
	}
		
	public static void main(String[] args) {
		
	}
}
