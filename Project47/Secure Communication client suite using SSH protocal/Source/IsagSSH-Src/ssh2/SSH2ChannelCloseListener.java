package ssh2;

/**
 * An interface for classes which want to be notified when a channel is closed.
 *
 * @see SSH2Channel
 */
public interface SSH2ChannelCloseListener {
    /**
     * Called when the channel is closed.
     *
     * @param channel The channel which is closed
     */
    public void closed(SSH2Channel channel);
}
