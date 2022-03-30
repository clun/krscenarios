A significant change to the Cassandra 4.X code has to do with how the code receives messages.
Prior to 4.0, the code would post a read and wait for a message.
The thread posting the read would block and not be able to do anything else until it received the message.

The new code uses a Java package known as _NIO_, and a messaging framework known as _Netty_.
This package and framework perform _asynchronous_ IO, which means the thread gets notified when it needs to receive a message.
The result is that threads no longer block and there is less overhead associated with thread-switching and management.

The bottom line is that Cassandra 4.X can process messages without consuming as much CPU!
