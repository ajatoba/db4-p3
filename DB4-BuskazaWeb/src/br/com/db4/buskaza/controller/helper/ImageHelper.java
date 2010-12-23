package br.com.db4.buskaza.controller.helper;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.apache.struts.upload.FormFile;
import org.jfree.chart.encoders.EncoderUtil;

import br.com.db4.buskaza.model.entity.Foto;
import br.com.db4.buskaza.model.entity.Planta;

public class ImageHelper
{
   

    public static byte[] resizeImage(byte[] image, float scaleX) throws IOException
    {
        
        ByteArrayInputStream stream = new ByteArrayInputStream(image);
        BufferedImage srcImg = ImageIO.read(stream);      
      
        if(srcImg == null)
        {
            return null;
        }
        
        int percentValue = (int) Math.ceil(srcImg.getWidth() / scaleX) ;
        
        int w =  srcImg.getWidth() / percentValue;
        
        int h =  srcImg.getHeight() / percentValue;
        
        BufferedImage shrunkImage = 
        	new BufferedImage(
        			w, 
        			h, 
        			srcImg.getType() != BufferedImage.TYPE_CUSTOM ? srcImg.getType() : BufferedImage.TYPE_INT_RGB);
        
        for (int y=0; y < h; ++y)
            for (int x=0; x < w; ++x)
                shrunkImage.setRGB(x, y, srcImg.getRGB(x*percentValue, y*percentValue));
        
                 
       return EncoderUtil.encode(shrunkImage, "png");
      
    }
    
    public static Foto gerarArquivo(FormFile formFile) throws IOException{    	  	
    	FileOutputStream out  = null;
    	
    	try {
    		Foto foto = new Foto();
        	String path = System.getProperty("path_arquivos");
    		
        	if(path == null || path.equals("")) throw new IOException ("Caminho dos Arquivos Não Configurado");
            
        	String nomeOriginal = formFile.getFileName();
        	String extencao = nomeOriginal.split("\\.")[1];
        	
        	String nomeNovo = String.valueOf(System.currentTimeMillis());
        	
        	StringBuilder fotoNovo = new StringBuilder()
        	.append(nomeNovo)
        	.append(".")
        	.append(extencao);
        	
        	StringBuilder fotoThumbNovo = new StringBuilder()
        	.append(nomeNovo)
        	.append("_thumb")
        	.append(".")
        	.append(extencao); 
        	
        	foto.setCaminho(fotoNovo.toString());
        	foto.setCaminhoThumbnail(fotoThumbNovo.toString());
        	
        	File caminho = new File(path);
        	File arquivoFoto = new File(caminho,fotoNovo.toString());
        	File arquivoFotoThumb = new File(caminho,fotoThumbNovo.toString());
        	
        	byte[] arquivoBytes = formFile.getFileData();
        	
        	out  = new FileOutputStream(arquivoFoto);
        	out.write(arquivoBytes);
        	
        	out = new FileOutputStream(arquivoFotoThumb);
        	out.write(resizeImage(arquivoBytes, 100));
        	
        	return foto;
		
		}finally{
			if(out != null) out.close();
		}
    	
    }
    
    
    public static Planta gerarPlanta(FormFile formFile) throws IOException{    	  	
    	FileOutputStream out  = null;
    	
    	try {
    		Planta planta = new Planta();
        	String path = System.getProperty("path_arquivos");
    		
    		if(path == null || path.equals("")) throw new IOException ("Caminho dos Arquivos Não Configurado");
    		
    		String nomeOriginal = formFile.getFileName();
        	String extencao = nomeOriginal.split("\\.")[1];
        	
        	String nomeNovo = String.valueOf(System.currentTimeMillis());
        	
        	StringBuilder fotoNovo = new StringBuilder()
        	.append(nomeNovo)
        	.append(".")
        	.append(extencao);
        	
        	
        	
        	planta.setCaminho(fotoNovo.toString());
        	
        	
        	File caminho = new File(path);
        	File arquivoFoto = new File(caminho,fotoNovo.toString());        	
        	
        	byte[] arquivoBytes = formFile.getFileData();
        	
        	out  = new FileOutputStream(arquivoFoto);
        	out.write(arquivoBytes);        	
        	
        	return planta;
		
		}finally{
			if(out != null) out.close();
		}
    	
    }
}
