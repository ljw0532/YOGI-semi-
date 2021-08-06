package util;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

public class FileUploadService {

	public static final int SAME = -1;
	public static final int RATIO = 0;

	public void makeBasePath(String path) {
		File dir = new File(path);
		if (!dir.exists()) {
			dir.mkdirs();
		}
	}

	public String saveFile(File file, String basePath, String fileName) throws IOException {
		if (file == null || file.getName().equals("") || file.length() <= 0) { // ������ null�̰ų� �����̸��� ""�̰ų�
																				// ���ϱ��̰� 0���� ������
			return null; // null ����
		}

		// ���̽� ���� ����
		makeBasePath(basePath);

		// ������ ��ü ��� ����
		String serverFullPath = basePath + "/" + fileName;

		// ��������
		FileInputStream inputStream = new FileInputStream(file);
		FileOutputStream outputStream = new FileOutputStream(serverFullPath);

		int read = 0;
		byte[] buffer = new byte[1024];
		while ((read = inputStream.read(buffer, 0, 1024)) != -1) {
			outputStream.write(buffer, 0, read);
		}
		outputStream.close();
		inputStream.close();
		return serverFullPath;
	}

	public static void resize(File src, File dest, int width, int height) throws IOException {
		FileInputStream srcIs = null;
		try {
			srcIs = new FileInputStream(src);
			FileUploadService.resize(srcIs, dest, width, height);
		} finally {
			if (srcIs != null)
				try {
					srcIs.close();
				} catch (IOException ex) {
				}
		}
	}

	public static void resize(InputStream src, File dest,int width, int height) throws IOException {
		BufferedImage srcImg = ImageIO.read(src);
		int srcWidth = srcImg.getWidth();
		int srcHeight = srcImg.getHeight();

		int destWidth = -1, destHeight = -1;

		if (width == SAME) {
			destWidth = srcWidth;
		} else if (width > 0) {
			destWidth = width;
		}

		if (height == SAME) {
			destHeight = srcHeight;
		} else if (height > 0) {
			destHeight = height;
		}

		if (width == RATIO && height == RATIO) {
			destWidth = srcWidth;
			destHeight = srcHeight;
		} else if (width == RATIO) {
			double ratio = ((double)destHeight) / ((double)srcHeight);
			destWidth = (int)((double)srcWidth * ratio);
		} else if (height == RATIO) {
			double ratio = ((double)destWidth) / ((double)srcWidth);
			destHeight = (int)((double)srcHeight * ratio);
		}

		BufferedImage destImg = new BufferedImage(
				destWidth, destHeight, BufferedImage.TYPE_3BYTE_BGR);
		Graphics2D g = destImg.createGraphics();
		g.drawImage(srcImg, 0, 0, destWidth, destHeight, null);

		ImageIO.write(destImg, "jpg", dest);
	}
}
