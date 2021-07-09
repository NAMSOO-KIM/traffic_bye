package traffic.bye.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class ImageController {

	
	// URI : /ItemImage?id=${item.id}&image=${item.real_file_name}
	/*
	@GetMapping(value = "/ItemImage")
	public void ItemImage(long id, String image, HttpServletResponse response) throws Exception {
		System.out.println(id + " " + image);
		String repo = "C:/traffic/resources/store/" + Long.toString(id) + "/image";
		String downImage = repo + "/" + image;
		File f = new File(downImage);
		response.setContentType("text/html; charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; image=" + URLEncoder.encode(image, "UTF-8"));
		try (FileInputStream in = new FileInputStream(f); OutputStream out = response.getOutputStream()) {
			byte[] buffer = new byte[1024 * 8];
			while (true) {
				int count = in.read(buffer);
				if (count == -1)
					break;
				out.write(buffer, 0, count);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	*/

	
}
