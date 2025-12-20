package gps.parser;

import java.util.NoSuchElementException;

/**
 * Tokenizer used in Parser.
 * 
 * @author Dominik Schmidt
 */
public class Tokenizer {
	/**
	 * Delimiter string.
	 */
	private static final String DELIMITER = ",";

	private int currentPosition;

	private int nextPosition;

	private String s;

	/**
	 * Constructs a new tokenizer for the given string.
	 * 
	 * @param s String to be tokenized
	 */
	public Tokenizer(String s) {
		this.s = s;
		this.currentPosition = 0;
		this.nextPosition = s.indexOf(DELIMITER, currentPosition);
	}

	/**
	 * @return True, if there is a token left
	 */
	public boolean hasNext() {
		return nextPosition != -1 && currentPosition <= nextPosition;
	}

	/**
	 * 
	 * @return Next token
	 * @throws NoSuchElementException If there is no token left
	 */
	public String next() throws NoSuchElementException {
		if (!hasNext())
			throw new NoSuchElementException();

		String next = s.substring(currentPosition, nextPosition);

		currentPosition = nextPosition + 1;
		nextPosition = s.indexOf(DELIMITER, currentPosition);

		return next;
	}
}