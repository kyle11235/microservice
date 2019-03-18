import java.io.IOException;

import org.apache.zookeeper.CreateMode;
import org.apache.zookeeper.KeeperException;
import org.apache.zookeeper.WatchedEvent;
import org.apache.zookeeper.Watcher;
import org.apache.zookeeper.ZooDefs.Ids;
import org.apache.zookeeper.ZooKeeper;

public class Test {

	/**
	 * @param args
	 * @throws IOException
	 * @throws InterruptedException
	 * @throws KeeperException
	 */
	public static void main(String[] args) throws IOException, KeeperException, InterruptedException {
		// 创建一个与服务器的连接
		String hostports = "192.168.1.117:2181,192.168.1.117:2182,192.168.1.117:2183";
		ZooKeeper zk = new ZooKeeper(hostports, 3000, new Watcher() {
			@Override
			public void process(WatchedEvent event) {
				System.out.println("已经触发了" + event.getType() + "事件！");
			}
		});

		// 创建一个目录节点
		zk.create("/testRootPath", "testRootData".getBytes(), Ids.OPEN_ACL_UNSAFE, CreateMode.PERSISTENT);
		// 创建一个子目录节点
		zk.create("/testRootPath/testChildPathOne", "testChildDataOne".getBytes(), Ids.OPEN_ACL_UNSAFE, CreateMode.PERSISTENT);
		System.out.println(new String(zk.getData("/testRootPath", false, null)));
		// 取出子目录节点列表
		System.out.println(zk.getChildren("/testRootPath", true));
		// 修改子目录节点数据
		zk.setData("/testRootPath/testChildPathOne", "modifyChildDataOne".getBytes(), -1);
		System.out.println("目录节点状态：[" + zk.exists("/testRootPath", true) + "]");
		// 创建另外一个子目录节点
		zk.create("/testRootPath/testChildPathTwo", "testChildDataTwo".getBytes(), Ids.OPEN_ACL_UNSAFE, CreateMode.PERSISTENT);
		System.out.println(new String(zk.getData("/testRootPath/testChildPathTwo", true, null)));
		// 删除子目录节点
		zk.delete("/testRootPath/testChildPathTwo", -1);
		zk.delete("/testRootPath/testChildPathOne", -1);
		// 删除父目录节点
		zk.delete("/testRootPath", -1);
		// 关闭连接
		zk.close();
	}

}
