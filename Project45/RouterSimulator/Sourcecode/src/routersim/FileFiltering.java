package routersim;

import java.io.File;
import javax.swing.*;
import javax.swing.filechooser.*;
import java.util.*;

public class FileFiltering extends FileFilter {

    // Accept all directories and all gif, jpg, or tiff files.
    public boolean accept(File f) {
        if (f.isDirectory()) {
            return true;
        }

        String extension = Utils.getExtension(f);
        if (extension != null) {
            if (extension.equals(Utils.Dat) )
                {
                    return true;
            } else {
                return false;
            }
            }

        return false;
    }

    // The description of this filter
    public String getDescription() {
        return "Routersim File";
    }
}
