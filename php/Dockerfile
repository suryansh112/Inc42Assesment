from php:latest

WORKDIR /home/php

COPY ${WORKSPACE}/php /home/php

RUN php /home/php/index.php

RUN chmod 777 *

CMD ["php","./index.php"]
