package websocket;

import java.util.concurrent.CopyOnWriteArraySet;
import java.io.IOException; 
import java.util.concurrent.CopyOnWriteArraySet; 
import javax.websocket.OnClose; 
import javax.websocket.OnError; 
import javax.websocket.OnMessage;
import javax.websocket.OnOpen; 
import javax.websocket.Session; 
import javax.websocket.server.ServerEndpoint;


/**
 * 将目前的类定义成一个websocket服务器端
 */ 
@ServerEndpoint("/go") 
public class TestWebsocket {
	
		//concurrent包的线程安全Set，用来存放每个客户端对应的Test对象。
		private static CopyOnWriteArraySet<TestWebsocket> set = new CopyOnWriteArraySet<TestWebsocket>(); 
		//与某个客户端的连接会话，需要通过它来给客户端发送数据 
		private Session session; 
		
		/**
	     * 连接建立成功调用的方法
	     * @param session
	     */ 
		@OnOpen 
		public void OnOpen(Session session) { 
			this.session = session; 
			set.add(this); 
			System.out.println("OnOpen()方法被执行..."); 
			System.out.println("websocket连接建立成功..."); 
			System.out.println(); 
		}
	
		 /**
	     * 连接关闭的方法
	     */ 
		@OnClose 
		public void OnClose() { 
			set.remove(this); 
			System.out.println("OnClose()方法被执行...");
			System.out.println("websocket连接已经关闭..."); 
			System.out.println(); 
		}
	
		/**
	     * 接收消息的方法
	     * @param msg
	     * @param session
	     */ 
		@OnMessage
		public void OnMessage(String msg, Session session) {
			System.out.println("已从客户端接收消息：" + msg);
			// 可以做一些复杂逻辑，这里每秒中发送一条数据
			for (int i = 0; i < 10; i++) {
				try {
					Thread.currentThread().sleep(1000);
					// 向所有客户端发消息
					for (TestWebsocket t : set) {
						t.sendResponse("这是第" + (i + 1) + "条信息...");
					}
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
	
			System.out.println("向客户端发送数据完毕...");
		}
				
			/**
		     * 出错的方法，注意参数不能错
		     * @param session
		     * @param error
		     */ 
			@OnError
			public void OnError(Session session, Throwable error) {
				System.out.println("OnError()方法被执行..."); 
				System.out.println("websocket出错..."); 
				System.out.println(); 
			}
	
			//发送数据到客户端，这个没有注解
			public void sendResponse(String str) { 
				try { 
						System.out.println("sendResponse()方法被执行...");
						this.session.getBasicRemote().sendText(str); 
					} catch (IOException e) {
						e.printStackTrace(); 
					} 
				}
			
	
}
