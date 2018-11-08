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
 * ��Ŀǰ���ඨ���һ��websocket��������
 */ 
@ServerEndpoint("/go") 
public class TestWebsocket {
	
		//concurrent�����̰߳�ȫSet���������ÿ���ͻ��˶�Ӧ��Test����
		private static CopyOnWriteArraySet<TestWebsocket> set = new CopyOnWriteArraySet<TestWebsocket>(); 
		//��ĳ���ͻ��˵����ӻỰ����Ҫͨ���������ͻ��˷������� 
		private Session session; 
		
		/**
	     * ���ӽ����ɹ����õķ���
	     * @param session
	     */ 
		@OnOpen 
		public void OnOpen(Session session) { 
			this.session = session; 
			set.add(this); 
			System.out.println("OnOpen()������ִ��..."); 
			System.out.println("websocket���ӽ����ɹ�..."); 
			System.out.println(); 
		}
	
		 /**
	     * ���ӹرյķ���
	     */ 
		@OnClose 
		public void OnClose() { 
			set.remove(this); 
			System.out.println("OnClose()������ִ��...");
			System.out.println("websocket�����Ѿ��ر�..."); 
			System.out.println(); 
		}
	
		/**
	     * ������Ϣ�ķ���
	     * @param msg
	     * @param session
	     */ 
		@OnMessage
		public void OnMessage(String msg, Session session) {
			System.out.println("�Ѵӿͻ��˽�����Ϣ��" + msg);
			// ������һЩ�����߼�������ÿ���з���һ������
			for (int i = 0; i < 10; i++) {
				try {
					Thread.currentThread().sleep(1000);
					// �����пͻ��˷���Ϣ
					for (TestWebsocket t : set) {
						t.sendResponse("���ǵ�" + (i + 1) + "����Ϣ...");
					}
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
	
			System.out.println("��ͻ��˷����������...");
		}
				
			/**
		     * ����ķ�����ע��������ܴ�
		     * @param session
		     * @param error
		     */ 
			@OnError
			public void OnError(Session session, Throwable error) {
				System.out.println("OnError()������ִ��..."); 
				System.out.println("websocket����..."); 
				System.out.println(); 
			}
	
			//�������ݵ��ͻ��ˣ����û��ע��
			public void sendResponse(String str) { 
				try { 
						System.out.println("sendResponse()������ִ��...");
						this.session.getBasicRemote().sendText(str); 
					} catch (IOException e) {
						e.printStackTrace(); 
					} 
				}
			
	
}
