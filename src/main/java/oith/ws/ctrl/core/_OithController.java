package oith.ws.ctrl.core;

import org.springframework.dao.DuplicateKeyException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import javax.annotation.Resource;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public abstract class _OithController {

    public static final String ERROR_NOT_LOGGED_IN = "error.message.not.found.logged";
    public static final String ERROR_MESSAGE_KEY_DELETED_WAS_NOT_FOUND = "error.message.not.found.deleted";
    public static final String ERROR_MESSAGE_KEY_EDITED_WAS_NOT_FOUND = "error.message.not.found.edited";
    public static final String ERROR_MESSAGE_KEY_COPIED_WAS_NOT_FOUND = "error.message.not.found.copied";

    public static final String FEEDBACK_MESSAGE_KEY_CREATED = "feedback.message.created";
    public static final String FEEDBACK_MESSAGE_KEY_DELETED = "feedback.message.deleted";
    public static final String FEEDBACK_MESSAGE_KEY_EDITED = "feedback.message.edited";
    public static final String FEEDBACK_MESSAGE_KEY_COPIED = "feedback.message.copied";

    public static final String INDEX = "index";
    public static final String LOGIN = "login";

    public static final String SEARCH_CRITERIA = "searchCriteria";
    private static final String ERROR_MESSAGE = "errorMessage";
    private static final String FEEDBACK_MESSAGE = "feedbackMessage";
    public static final String REDIRECT = "redirect:";

    public static final String REDIRECT_TO_LOGIN = "/login";

    public static final String NOT_FOUND = REDIRECT + "/index";

    @Resource
    private MessageSource messageSource;

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        dateFormat.setLenient(false);
        webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    /**
     * Adds a new error message
     *
     * @param model A model which stores the the error message.
     * @param code A message code which is used to fetch the correct message
     * from the message source.
     * @param params The parameters attached to the actual error message.
     */
    public void addErrorMessage(RedirectAttributes model, String code, Object... params) {
        Locale current = LocaleContextHolder.getLocale();
        String localizedErrorMessage = messageSource.getMessage(code, params, current);
        model.addFlashAttribute(ERROR_MESSAGE, localizedErrorMessage);
    }

    /**
     * Adds a new feedback message.
     *
     * @param model A model which stores the feedback message.
     * @param code A message code which is used to fetch the actual message from
     * the message source.
     * @param params The parameters which are attached to the actual feedback
     * message.
     */
    public void addFeedbackMessage(RedirectAttributes model, String code, Object... params) {
        Locale current = LocaleContextHolder.getLocale();
        String localizedFeedbackMessage = messageSource.getMessage(code, params, current);
        model.addFlashAttribute(FEEDBACK_MESSAGE, localizedFeedbackMessage);
    }

    public String multipartFileHandlerx(MultipartHttpServletRequest request, String col) {
        return "";
    }

    public String multipartImageFileHandlerx(MultipartHttpServletRequest request, String col) {
        return "";
    }

    /**
     * Creates a redirect view path for a specific controller action
     *
     * @param path The path processed by the controller method.
     * @return A redirect view path to the given controller method.
     */
    public String createRedirectViewPath(String path) {
        StringBuilder builder = new StringBuilder();
        builder.append(REDIRECT);
        builder.append(path);
        return builder.toString();
    }

    public void errorHandler(BindingResult bindingResult, Exception e) {

        if (e instanceof DuplicateKeyException) {
            DuplicateKeyException uuu = (DuplicateKeyException) e;

            String hhh = uuu.getCause().getMessage();

            System.out.println("err dup key: " + hhh);

            int kk = hhh.lastIndexOf(": \"");
            if (kk != -1) {
                hhh = hhh.substring(kk + 3, hhh.length() - 4);
            }

            ObjectError yyyy = new ObjectError(bindingResult.getObjectName(), "Duplicate record notification for value '" + hhh + "'");
            //FieldError yyyy=   new FieldError(bindingResult.getObjectName(), "code", e.getMessage()+" real val: "+ uuu.getRootCause()+" hhhh"+ val);

            bindingResult.addError(yyyy);
        }
    }
}
