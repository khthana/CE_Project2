package gps;

import gps.datatypes.Record;
import gps.exceptions.EmptyBufferException;


/**
 * Stores a single record (GPS data).
 * 
 * @author  Dominik Schmidt
 */
public class RecordBuffer {
    private Record record;
    private static final long WAIT = 1000;
    
    /** 
     * Creates a new instance of RecordBuffer 
     */
    public RecordBuffer() {
         record = null;
    }
    
    /**
     * Gets stored record.
     * 
     * @return Stored record
     * @throws EmptyBufferException If buffer is empty
     */
    public synchronized Record getRecord() throws EmptyBufferException {
        if(record == null)
            throw new EmptyBufferException("Record buffer is empty.");

        return record;
    }
    
    /**
     * Puts record in buffer.
     * 
     * @param record Record to be stored
     */
    public synchronized void putRecord(Record record) {        
        this.record = record;
    }
    
}
